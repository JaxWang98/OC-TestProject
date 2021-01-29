//
//  ZJFunctionDefines.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2021/1/28.
//  Copyright © 2021 widerness. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ZJWeakSelf(type)      __weak typeof(type) weak##type = type
#define ZJStrongSelf(_instance)    __strong typeof(weak##_instance) _instance = weak##_instance

NS_ASSUME_NONNULL_END
