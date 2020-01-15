//
//  HGYSinglePickerView.m
//  ZHCPickerHelper
//
//  Created by cy on 2020/1/14.
//

#import "HGYSinglePickerView.h"

@interface HGYSinglePickerView()

@property (nonatomic, copy) SingleConfirmAction confirmAction;

@end

@implementation HGYSinglePickerView

- (instancetype)setDataArray:(NSArray<NSString *> *)array {
    [self setBaseDataArray:@[array]];
    return self;
}

- (void)showWithConfirmAction:(SingleConfirmAction)action {
    _confirmAction = action;
    [self addSelfToKeyWindow];
}

- (void)confirmEvent {
    NSInteger selectedRow = [self.pickerView selectedRowInComponent:0];
    _confirmAction(selectedRow, self.dataArray[0][selectedRow]);
}

@end
