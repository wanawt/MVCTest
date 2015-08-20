//
//  UserModel.m
//  MVCTest
//
//  Created by WangTu on 15/8/19.
//  Copyright (c) 2015年 WangTu. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (id)init {
    if (self == [super init]) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key {
    return @"";
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [self.dict setObject:value forKey:key];
}

@end
