//
//  main.m
//  NSArray的二分查找
//
//  Created by taowang on 15/7/9.
//  Copyright © 2015年 Plague. All rights reserved.
//

#import <Foundation/Foundation.h>
NSUInteger separateSearchOfArray();
void seperateSearchOfCFArray();
void selfMakeSeperate();
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
     
//        NSLog(@"%lu",(unsigned long)separateSearchOfArray());
        seperateSearchOfCFArray();
    }
    return 0;
}
//系统实现的二分法查找
NSUInteger separateSearchOfArray()
{
    NSArray *sortedArray = [NSArray arrayWithObjects:@1,@3,@5,@5,@8, nil];
    id searchObject = @5;
    NSRange searchRange = NSMakeRange(0, sortedArray.count);
    NSUInteger findIndex = [sortedArray indexOfObject:searchObject inSortedRange:searchRange options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(id  __nonnull obj1, id  __nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    return findIndex;
}
void seperateSearchOfCFArray()
{
    NSMutableArray *sortedArray = [NSMutableArray arrayWithObjects: @"Alice", @"Beth", @"Carol",@"Ellen",nil];
    //Where is "Beth"?
    unsigned index = (unsigned)CFArrayBSearchValues((CFArrayRef)sortedArray,
                                                    CFRangeMake(0, CFArrayGetCount((CFArrayRef)sortedArray)),
                                                    (CFStringRef)@"Beth",
                                                    (CFComparatorFunction)CFStringCompare,
                                                    NULL);
    if (index < [sortedArray count] && [@"Beth" isEqualToString:sortedArray[index]])
    {
        NSLog(@"Beth was found at index %u", index);
    } else {
        NSLog(@"Beth was not found (index is beyond the bounds of sortedArray)");
    }
    
    //Where should we insert "Debra"?
    unsigned insertIndex = (unsigned)CFArrayBSearchValues((CFArrayRef)sortedArray,
                                                          CFRangeMake(0, CFArrayGetCount((CFArrayRef)sortedArray)),
                                                          (CFStringRef)@"Debra",
                                                          (CFComparatorFunction)CFStringCompare,
                                                          NULL);
    [sortedArray insertObject:@"Debra" atIndex:insertIndex];
    NSLog(@"%@",sortedArray);
}
void selfMakeSeperate()
{
    NSArray *numberArray = @[@1,@3,@27,@36,@42,@70,@82];
    NSNumber *searchNum = @70;
    NSUInteger mid;
    NSUInteger min = 0;
    NSUInteger max = numberArray.count - 1;
    
    BOOL found = NO;
    while (min <= max) {
        mid = (min + max)/2;
        if ([searchNum intValue] == [numberArray[mid] intValue]) {
            NSLog(@"We found the number! It is at index %lu", mid);
            found = YES;
            break;
        }else if ([searchNum intValue] < [numberArray[mid] intValue]){
            max = mid - 1;
        }else if ([searchNum intValue] > [numberArray[mid] intValue]){
            min = mid + 1;
        }
    }
    if (!found) {
        NSLog(@"The number was not found.");
    }
    
}