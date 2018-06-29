//
//  YMGenerateHospitalDoctorModuleVC.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/13.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGenerateHospitalDoctorModuleVC.h"

#import "WebHospitalViewController.h"
#import "DoctorsDetailViewController.h"

@implementation YMGenerateHospitalDoctorModuleVC

+ (NSString *)moduleName
{
    return YMPushURLHospitalDoctorModuleName;
}

+ (UIViewController *)generateMuduleVCWithItem:(YMGenerateModuleItem *)item
{
    NSString *modulePath = item.modulePath;
    if ([modulePath isEqualToString:YMPushURLDoctorHomePagePath]) {
        
        NSString *doctorId = item.query[@"doctorId"];
        CGDebugAssert(doctorId, @"缺少医生id");
        if (doctorId.length == 0) {
            return nil;
        }
        DoctorsDetailViewController *doctorHomeVC = [[DoctorsDetailViewController alloc] init];
        doctorHomeVC.doctorsId = doctorId;
        return doctorHomeVC;
        
    }else if ([modulePath isEqualToString:YMPushURLHospitalHomePagePath]) {
        
        NSString *hospitalId = item.query[@"hospitalId"];
        CGDebugAssert(hospitalId.length, @"缺少医院id");
        if (hospitalId.length == 0) {
            return nil;
        }
        WebHospitalViewController *hospitalHomeVC = [[WebHospitalViewController alloc] init];
        hospitalHomeVC.hospitalId = hospitalId;
        return hospitalHomeVC;
    }
    return nil;
}

@end
