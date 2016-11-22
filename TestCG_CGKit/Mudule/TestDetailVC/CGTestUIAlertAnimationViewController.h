//
//  CGTestUIAlertAnimationViewController.h
//  TestCG_CGKit
//
//  Created by DY on 2016/11/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGBaseViewController.h"

@interface CGTestUIAlertAnimationViewController : CGBaseViewController

@end

@interface CALayer (CGTestLayer)

- (void)cg_addAnimation:(CAAnimation *)anim forKey:(NSString *)key;

@end
