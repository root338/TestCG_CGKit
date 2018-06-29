//
//  YMPushURL+YMCreateHospitalDoctorModuleURL.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMPushURL (YMCreateHospitalDoctorModuleURL)

+ (nullable NSURL *)createHospitalDetailVCWithHospitalId:(NSString *)hospitalId;
+ (nullable NSURL *)createDoctorDetailVCWithDoctorId:(NSString *)doctorId;

@end
NS_ASSUME_NONNULL_END
