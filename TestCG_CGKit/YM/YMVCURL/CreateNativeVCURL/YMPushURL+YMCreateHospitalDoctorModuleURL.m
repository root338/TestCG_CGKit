//
//  YMPushURL+YMCreateHospitalDoctorModuleURL.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL+YMCreateHospitalDoctorModuleURL.h"

@implementation YMPushURL (YMCreateHospitalDoctorModuleURL)

+ (NSURL *)createHospitalDetailVCWithHospitalId:(NSString *)hospitalId
{
    if (hospitalId.length == 0) {
        return nil;
    }
    NSDictionary *parameters = @{
                                 @"hospitalId" : hospitalId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLHospitalHomePagePath parameters:parameters];
}

+ (NSURL *)createDoctorDetailVCWithDoctorId:(NSString *)doctorId
{
    if (doctorId.length == 0) {
        return nil;
    }
    NSDictionary *parameters = @{
                                 @"doctorId" : doctorId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLDoctorHomePagePath parameters:parameters];
}

@end
