//
//  HGYBasePickerView.h
//  ZHCPickerHelper
//
//  Created by cy on 2020/1/14.
//

#define ZHCStatusHeight                         UIApplication.sharedApplication.statusBarFrame.size.height
#define ZHCScreenWidth                          UIScreen.mainScreen.bounds.size.width
#define ZHCScreenHeight                         UIScreen.mainScreen.bounds.size.height
#define ZHCNaviHeight                           (ZHCStatusHeight + 44)
#define ZHCBottomSafeHeight                     (ZHCStatusHeight > 21.0 ? 34 : 0)

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGYBasePickerView : UIView

@property (nonatomic, strong, readonly) NSArray<NSArray *>    *dataArray;
@property (nonatomic, strong) NSArray           *defaultSelectedRows;
@property (nonatomic, assign) CGFloat           defaultRowHeight;

@property (nonatomic, strong) UIPickerView      *pickerView;

- (void)setBaseDataArray:(NSArray<NSArray *> *)array;

- (void)addSelfToKeyWindow;

- (void)addSelfToView:(UIView *)view;

- (void)removeSelf;

- (void)confirmEvent;

- (void)cancelEvent;

@end

NS_ASSUME_NONNULL_END
