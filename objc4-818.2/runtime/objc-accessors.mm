/*
 * Copyright (c) 2006-2008 Apple Inc.  All Rights Reserved.
 * 
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */

#include <string.h>
#include <stddef.h>

#include <libkern/OSAtomic.h>

#include "objc-private.h"
#include "runtime.h"

// stub interface declarations to make compiler happy.

@interface __NSCopyable
- (id)copyWithZone:(void *)zone;
@end

@interface __NSMutableCopyable
- (id)mutableCopyWithZone:(void *)zone;
@end

StripedMap<spinlock_t> PropertyLocks;
StripedMap<spinlock_t> StructLocks;
StripedMap<spinlock_t> CppObjectLocks;

#define MUTABLE_COPY 2

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic) {
    if (offset == 0) {
        return object_getClass(self);
    }

    // Retain release world
    id *slot = (id*) ((char*)self + offset);
    if (!atomic) return *slot;
        
    // Atomic retain release world
    spinlock_t& slotlock = PropertyLocks[slot];
    slotlock.lock();
    id value = objc_retain(*slot);
    slotlock.unlock();
    
    // for performance, we (safely) issue the autorelease OUTSIDE of the spinlock.
    return objc_autoreleaseReturnValue(value);
}


static inline void reallySetProperty(id self, SEL _cmd, id newValue, ptrdiff_t offset, bool atomic, bool copy, bool mutableCopy) __attribute__((always_inline));







// 关联属性，设置


static inline void reallySetProperty(id self, SEL _cmd, id newValue, ptrdiff_t offset, bool atomic, bool copy, bool mutableCopy)
{
    if (offset == 0) {
        object_setClass(self, newValue);
        return;
    }

    id oldValue;
    
    
    
    // 通过偏移，拿到地址
    
    id *slot = (id*) ((char*)self + offset);

    if (copy) {
        newValue = [newValue copyWithZone:nil];
    } else if (mutableCopy) {
        newValue = [newValue mutableCopyWithZone:nil];
    } else {
        if (*slot == newValue) return;
        
        // retain 新
        newValue = objc_retain(newValue);
    }

    if (!atomic) {
        
        // 修饰符， 对应 non atomic
        oldValue = *slot;
        
        
        
        // 赋值
        
        // 有个地址，指向他
        *slot = newValue;
    } else {
        
        // 修饰符， 对应 atomic
        
        spinlock_t& slotlock = PropertyLocks[slot];
        slotlock.lock();
        oldValue = *slot;
        *slot = newValue;        
        slotlock.unlock();
    }
    // release 旧
    objc_release(oldValue);
}


















// set 方法的实质： 对新值的 retain, 对旧值的 release

// 每个属性调用的 getter setter 方法名不一样，

// 底层的逻辑一样 , retain 新， release 旧

// 中间加一层，      objc_setProperty         中间层的包装处理

// 设计模式中的适配器 adapter











//   LLVM 没有生成很多的中间代码，SEL 、 IMP







//  设置属性




void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, signed char shouldCopy) 
{
    bool copy = (shouldCopy && shouldCopy != MUTABLE_COPY);
    bool mutableCopy = (shouldCopy == MUTABLE_COPY);
    reallySetProperty(self, _cmd, newValue, offset, atomic, copy, mutableCopy);
}










void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
    reallySetProperty(self, _cmd, newValue, offset, true, false, false);
}












void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
    reallySetProperty(self, _cmd, newValue, offset, false, false, false);
}


void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
    reallySetProperty(self, _cmd, newValue, offset, true, true, false);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
    reallySetProperty(self, _cmd, newValue, offset, false, true, false);
}


// This entry point was designed wrong.  When used as a getter, src needs to be locked so that
// if simultaneously used for a setter then there would be contention on src.
// So we need two locks - one of which will be contended.
void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong __unused) {
    spinlock_t *srcLock = nil;
    spinlock_t *dstLock = nil;
    if (atomic) {
        srcLock = &StructLocks[src];
        dstLock = &StructLocks[dest];
        spinlock_t::lockTwo(srcLock, dstLock);
    }

    memmove(dest, src, size);

    if (atomic) {
        spinlock_t::unlockTwo(srcLock, dstLock);
    }
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (*copyHelper) (void *dest, const void *source)) {
    spinlock_t *srcLock = &CppObjectLocks[src];
    spinlock_t *dstLock = &CppObjectLocks[dest];
    spinlock_t::lockTwo(srcLock, dstLock);

    // let C++ code perform the actual copy.
    copyHelper(dest, src);
    
    spinlock_t::unlockTwo(srcLock, dstLock);
}
