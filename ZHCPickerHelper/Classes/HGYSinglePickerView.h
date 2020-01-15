//
//  HGYSinglePickerView.h
//  ZHCPickerHelper
//
//  Created by cy on 2020/1/14.
//

#import "HGYBasePickerView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SingleConfirmAction)(NSInteger, NSString *);

@interface HGYSinglePickerView : HGYBasePickerView

- (instancetype)setDataArray:(NSArray<NSString *> *)array;

- (void)showWithConfirmAction:(SingleConfirmAction)action;

@end

NS_ASSUME_NONNULL_END
