//
//  YMDiaryPostsCellManager.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsCellManager.h"
#import "YMDiaryPostsCellLayout.h"

#import "UIImage+CGImage.h"

/**
 日记帖子图片的布局样式
 
 - _YMDiaryPostsImagesLayoutStyle1: 在规定的 size 中显示 2 张图片，且宽高相等水平对齐， img1.size = img2.size
 - _YMDiaryPostsImagesLayoutStyle2: 在规定的 size 中显示 3 张图片，且左侧为 1 张大图，右侧 2 张图片宽高相等，垂直对齐，img1.width = img1.height, img2.size = img3.size img1.height = img2.height + img3.height + space
 - _YMDiaryPostsImagesLayoutStyle3: 在规定的 size 中显示 3 张图片，3 张图片等宽等高水平对齐
 - _YMDiaryPostsImagesLayoutStyle4: 在 _YMDiaryPostsImagesLayoutStyle2 条件下，仅显示左侧的大图
 */
typedef NS_OPTIONS(NSInteger, _YMDiaryPostsImagesLayoutStyle) {
    _YMDiaryPostsImagesLayoutStyle1 = 1 << 0,
    _YMDiaryPostsImagesLayoutStyle2 = 1 << 1,
    _YMDiaryPostsImagesLayoutStyle3 = 1 << 2,
    _YMDiaryPostsImagesLayoutStyle4 = 1 << 3,
};

@interface YMDiaryPostsCellManager ()
{
    
}

@property (nonatomic, assign) CGFloat dayTextSpace;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDictionary *titleAttDict;
@property (nonatomic, strong) NSDictionary *titleDayAttDict;
@property (nonatomic, strong) NSDictionary *textAttDict;

@property (nonatomic, strong) NSMutableAttributedString *titleMutableAtt;
@property (nonatomic, assign) NSRange titleDayRange;

@property (nonatomic, assign) CGFloat textMaxHeight;

@property (nonatomic, strong) UIImage *testImage;
@property (nonatomic, strong) NSMutableDictionary *testDic;
@end

@implementation YMDiaryPostsCellManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _dayTextSpace   = 0;
    }
    return self;
}

- (CGFloat)getCellHeightWithData:(NSIndexPath *)indexPath width:(CGFloat)width
{
    YMDiaryPostsCellLayout *cellLayout = self.testDic[indexPath];
    if (cellLayout) {
        return cellLayout.drawSize.height;
    }
    cellLayout = [self createCellLayoutWithData:nil width:width];
    self.testDic[indexPath] = cellLayout;
    return cellLayout.drawSize.height;
}

- (void)getDiaryPostsContentImageWithIndexPath:(NSIndexPath *)indexPath completion:(void (^)(UIImage *))completion
{
    [self getDiaryPostsContentImageWithData:nil layout:self.testDic[indexPath] completion:completion];
}

- (YMDiaryPostsCellLayout *)createCellLayoutWithData:(id)data width:(CGFloat)width
{
    
    UIEdgeInsets insets = UIEdgeInsetsMake(22, 13, 15, 35);
    
    NSString *day   = @"198";
    NSString *text  = @"劳动节弗拉索夫绝世独立风刀霜剑雷锋精神的浪费的房间里都是减肥的说了分手的房间收到了附近圣诞快乐都是分离圣诞节费拉达斯房间收到了附近的说了";
    
    CGFloat contentOriginX  = 54;
    CGFloat contentMaxWidth = width - contentOriginX - insets.right;
    
    CGPoint point   = CGPointMake(contentOriginX, insets.top);
    
    [self.titleMutableAtt replaceCharactersInRange:self.titleDayRange withAttributedString:[[NSAttributedString alloc] initWithString:day attributes:self.titleDayAttDict]];
    self.titleDayRange  = NSMakeRange(2, day.length);
    
    CGRect titleRect    = CGRectMake(point.x, point.y, contentMaxWidth, self.titleMutableAtt.size.height);
    point.y = CGRectGetMaxY(titleRect) + 18;
    
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(contentMaxWidth, self.textMaxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textAttDict context:nil];
    textRect.origin = CGPointMake(point.x, point.y);
    point.y = CGRectGetMaxY(textRect) + 15;
    
    __block NSArray *imgRectValues = nil;
    __block CGRect imgTotalRect    = CGRectZero;
    [self calculateImagesRectWithImages:nil origin:point width:contentMaxWidth completion:^(NSArray<NSValue *> *imageRectValues, CGRect imagesTotleRect) {
        imgRectValues   = imageRectValues;
        imgTotalRect    = imagesTotleRect;
    }];
    
    YMMutableDiaryPostsCellLayout *cellLayout = [[YMMutableDiaryPostsCellLayout alloc] init];
    cellLayout.drawSize = CGSizeMake(width, CGRectGetMaxY(imgTotalRect) + insets.bottom);
    cellLayout.insets   = insets;
    cellLayout.titleRect = titleRect;
    cellLayout.contentTextRect = textRect;
    cellLayout.imagesTotalRect  = imgTotalRect;
    cellLayout.imageRectValues  = imgRectValues;
    
    return cellLayout;
}

- (void)getDiaryPostsContentImageWithData:(id)data layout:(YMDiaryPostsCellLayout *)layout completion:(void (^)(UIImage *))completion
{
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        
        UIImage * (^drawImage) (CGContextRef) = ^(CGContextRef context) {
            NSString *day   = @"198";
            NSString *text  = @"劳动节弗拉索夫绝世独立风刀霜剑雷锋精神的浪费的房间里都是减肥的说了分手的房间收到了附近圣诞快乐都是分离圣诞节费拉达斯房间收到了附近的说了";
            
            [[UIColor whiteColor] setFill];
            CGContextFillRect(context, CGRectMake(0, 0, layout.drawSize.width, layout.drawSize.height + 1));
            
            NSMutableAttributedString *titleAtt = [[NSMutableAttributedString alloc] initWithString:self.title attributes:self.titleAttDict];
            [titleAtt replaceCharactersInRange:NSMakeRange(2, 0) withAttributedString:[[NSAttributedString alloc] initWithString:day attributes:self.titleDayAttDict]];
            self.titleDayRange  = NSMakeRange(2, day.length);
            [self.titleMutableAtt drawWithRect:layout.titleRect options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine context:nil];
            [text drawWithRect:layout.contentTextRect options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:self.textAttDict context:nil];
            
            CGContextSaveGState(context);
            
            CGContextTranslateCTM(context, 0, CGRectGetMinY(layout.imageRectValues.firstObject.CGRectValue) - layout.insets.bottom);
            for (NSValue *obj in layout.imageRectValues) {
                
                CGRect imageRect = obj.CGRectValue;
                
                CGContextSaveGState(context);
                CGContextTranslateCTM(context, 0, layout.drawSize.height);
                CGContextScaleCTM(context, 1.0, -1.0);
                
                UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:imageRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(layout.imageCornerRadius, layout.imageCornerRadius)];
                [bezierPath addClip];
                
                [[UIColor orangeColor] setFill];
                [bezierPath fill];
                
                UIImage *testImage = self.testImage;
                CGRect drawImageRect = [testImage imageFrameWithRect:imageRect contentModel:UIViewContentModeScaleAspectFill];
                CGContextDrawImage(context, drawImageRect, self.testImage.CGImage);
                
                CGContextRestoreGState(context);
            }
            
            CGContextRestoreGState(context);
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return image;
        };
        
        UIGraphicsBeginImageContextWithOptions(layout.drawSize, layout.opaque, layout.scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        if (context == nil) {
            UIGraphicsEndImageContext();
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(nil);
                }
            });
            
            NSLog(@"获取 context 失败");
            return;
        }
        
        UIImage *image = drawImage(context);
        
        UIGraphicsEndImageContext();
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(image);
        });
    });
    
}

- (void)calculateImagesRectWithImages:(NSArray *)images origin:(CGPoint)origin width:(CGFloat)width completion:(void (^) (NSArray<NSValue *> *imageRectValues, CGRect imagesTotleRect))completion
{
    
    CGFloat imageSpace  = 5;
    
    NSValue * (^addImageRect) (CGRect) = ^(CGRect imgRect){
        NSValue *value = [NSValue valueWithCGRect:imgRect];
        return value;
    };
    
    NSInteger imagesTotalCount = arc4random() % 7 + 1;
    
    NSArray * (^imageLayoutStyleBlock) (void) = ^ {
        switch (imagesTotalCount) {
            case 0:
                return (NSArray *)nil;
            case 1:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle4),
                         ];
            case 2:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle1),
                         ];
            case 3:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle2),
                         ];
            case 4:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle1),
                         @(_YMDiaryPostsImagesLayoutStyle1),
                         ];
            case 5:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle1),
                         @(_YMDiaryPostsImagesLayoutStyle3),
                         ];
                break;
            default:
                return @[
                         @(_YMDiaryPostsImagesLayoutStyle2),
                         @(_YMDiaryPostsImagesLayoutStyle3),
                         ];
        }
        return (NSArray *)nil;
    };

    
    NSArray *imagesLayoutStyles = imageLayoutStyleBlock();
    
//    NSArray *imagesLayoutStyles = @[
//                                    @(_YMDiaryPostsImagesLayoutStyle2),
//                                    @(_YMDiaryPostsImagesLayoutStyle3),
//                                    ];
    
    NSArray * (^styleOne) (CGRect imagesRect, CGFloat *) = ^(CGRect imagesRect, CGFloat *height){
        
        CGFloat x   = CGRectGetMinX(imagesRect);
        CGFloat y   = CGRectGetMinY(imagesRect);
        CGFloat imageContentWidth = CGRectGetWidth(imagesRect);
        
        CGFloat width1 = (imageContentWidth - imageSpace) / 2.0;
        CGFloat height1 = width1;
        CGRect img1Rect = CGRectMake(x, y, width1, height1);
        CGRect img2Rect = CGRectMake(CGRectGetMaxX(img1Rect) + imageSpace, y, width1, height1);
        
        *height         = CGRectGetHeight(img2Rect);
        
        return @[
                 addImageRect(img1Rect),
                 addImageRect(img2Rect)
                 ];
    };
    
    NSArray * (^styleTwo) (CGRect imagesRect, CGFloat *) = ^(CGRect imagesRect, CGFloat *height) {
        CGFloat x   = CGRectGetMinX(imagesRect);
        CGFloat y   = CGRectGetMinY(imagesRect);
        CGFloat imageContentWidth = CGRectGetWidth(imagesRect);
        CGFloat width1  = (imageContentWidth - imageSpace / 2.0) * 2 / 3;
        CGFloat height1 = width1;
        CGFloat width2  = imageContentWidth - imageSpace - width1;
        CGFloat height2 = (width1 - imageSpace) / 2.0;
        
        CGRect img1Rect = CGRectMake(x, y, width1, height1);
        CGRect img2Rect = CGRectMake(x + width1 + imageSpace, y, width2, height2);
        CGRect img3Rect = CGRectMake(CGRectGetMinX(img2Rect), CGRectGetMaxY(img2Rect) + imageSpace, width2, height2);
        
        *height         = CGRectGetHeight(img1Rect);
        
        return @[
                 addImageRect(img1Rect),
                 addImageRect(img2Rect),
                 addImageRect(img3Rect)
                 ];
    };
    
    NSArray * (^styleThree) (CGRect imagesRect, CGFloat *) = ^(CGRect imagesRect, CGFloat *height) {
        CGFloat x   = CGRectGetMinX(imagesRect);
        CGFloat y   = CGRectGetMinY(imagesRect);
        CGFloat imageContentWidth = CGRectGetWidth(imagesRect);
        CGFloat width1  = (imageContentWidth - 2 * imageSpace) / 3.0;
        CGFloat height1 = width1;
        CGRect img1Rect = CGRectMake(x, y, width1, height1);
        CGRect img2Rect = CGRectMake(CGRectGetMaxX(img1Rect) + imageSpace, y, width1, height1);
        CGRect img3Rect = CGRectMake(CGRectGetMaxX(img2Rect) + imageSpace, y, width1, height1);
        *height         = CGRectGetHeight(img3Rect);
        return @[
                 addImageRect(img1Rect),
                 addImageRect(img2Rect),
                 addImageRect(img3Rect),
                 ];
    };
    
    NSArray * (^styleFour) (CGRect imagesRect, CGFloat *) = ^(CGRect imagesRect, CGFloat *height) {
        return @[
                 styleTwo(imagesRect, height).firstObject,
                 ];
    };
    
    NSMutableArray *imageRectValues     = [NSMutableArray array];
    __block CGRect imagesRect           = CGRectMake(origin.x, origin.y, width, 0);
    __block CGFloat imagesTotalHeight   = 0;
    NSInteger imageLayoutStyleCount     = imagesLayoutStyles.count;
    
    [imagesLayoutStyles enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        _YMDiaryPostsImagesLayoutStyle imgLayoutStyle = [obj integerValue];
        CGFloat height  = 0;
        
        switch (imgLayoutStyle) {
            case _YMDiaryPostsImagesLayoutStyle1:
                [imageRectValues addObjectsFromArray:styleOne(imagesRect, &height)];
                break;
            case _YMDiaryPostsImagesLayoutStyle2:
                [imageRectValues addObjectsFromArray:styleTwo(imagesRect, &height)];
                break;
            case _YMDiaryPostsImagesLayoutStyle3:
                [imageRectValues addObjectsFromArray:styleThree(imagesRect, &height)];
                break;
            case _YMDiaryPostsImagesLayoutStyle4:
                [imageRectValues addObjectsFromArray:styleFour(imagesRect, &height)];
                break;
        }
        imagesTotalHeight += height;
        if (imageLayoutStyleCount >= idx + 1) {
            imagesRect.origin.y += height + imageSpace;
            imagesTotalHeight   += imageSpace;
        }
    }];
    
    completion(imageRectValues, CGRectMake(origin.x, origin.y, width, imagesTotalHeight));
}

- (NSString *)title
{
    if (_title) {
        return _title;
    }
    _title = @"术后天";
    return _title;
}

- (NSDictionary *)titleAttDict
{
    if (_titleAttDict) {
        return _titleAttDict;
    }
    
    _titleAttDict = @{
                      NSFontAttributeName : [UIFont systemFontOfSize:20],
                      NSForegroundColorAttributeName : [UIColor orangeColor],
                      };
    
    return _titleAttDict;
}

- (NSDictionary *)titleDayAttDict
{
    if (_titleDayAttDict) {
        return _titleDayAttDict;
    }
    
    _titleDayAttDict = @{
                         NSFontAttributeName : self.titleAttDict[NSFontAttributeName],
                         NSForegroundColorAttributeName : [UIColor redColor],
                         };
    
    return _titleDayAttDict;
}

- (NSDictionary *)textAttDict
{
    if (_textAttDict) {
        return _textAttDict;
    }
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    style.lineSpacing = 2;
    _textAttDict = @{
                     NSFontAttributeName : [UIFont systemFontOfSize:15],
                     NSForegroundColorAttributeName : [UIColor orangeColor],
                     NSParagraphStyleAttributeName : style,
                     };
    
    return _textAttDict;
}

- (NSMutableAttributedString *)titleMutableAtt
{
    if (_titleMutableAtt) {
        return _titleMutableAtt;
    }
    
    _titleMutableAtt = [[NSMutableAttributedString alloc] initWithString:self.title attributes:self.titleAttDict];
    
    return _titleMutableAtt;
}

- (NSRange)titleDayRange
{
    if (_titleDayRange.location > 0) {
        return _titleDayRange;
    }
    _titleDayRange = NSMakeRange(2, 0);
    return _titleDayRange;
}

- (CGFloat)textMaxHeight
{
    if (_textMaxHeight > 0) {
        return _textMaxHeight;
    }
    
    _textMaxHeight = [(UIFont *)self.textAttDict[NSFontAttributeName] lineHeight] * 2;
    return _textMaxHeight;
}

- (UIImage *)testImage
{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]];
    _testImage = [[UIImage alloc] initWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationDown];
    
    return _testImage;
}

- (NSMutableDictionary *)testDic
{
    if (_testDic) {
        return _testDic;
    }
    _testDic = [NSMutableDictionary dictionary];
    return _testDic;
}

@end
