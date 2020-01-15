//
//  HGYBasePickerView.m
//  ZHCPickerHelper
//
//  Created by cy on 2020/1/14.
//

#import "HGYBasePickerView.h"

@interface UIView (ZHCFrame)

@property (nonatomic, assign) CGFloat zhc_top;

@end

@implementation UIView (ZHCFrame)

- (CGFloat)zhc_top {
    return self.frame.origin.y;
}

- (void)setZhc_top:(CGFloat)zhc_top {
    CGRect frame = self.frame;
    frame.origin.y = zhc_top;
    self.frame = frame;
}

@end

@interface HGYBasePickerView() <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong, readwrite) NSArray<NSArray *>    *dataArray;

@property (nonatomic, strong) UIView        *baseView;
@property (nonatomic, strong) UIButton      *confirmButton;
@property (nonatomic, strong) UIButton      *cancelButton;

@end

@implementation HGYBasePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:UIScreen.mainScreen.bounds];
    if (self) {
        _defaultSelectedRows = @[@0];
        _defaultRowHeight = 44;
        
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
    
    [self addSubview:self.baseView];
    [self.baseView addSubview:self.pickerView];
    [self.baseView addSubview:self.confirmButton];
    [self.baseView addSubview:self.cancelButton];
    
    CGFloat buttonHeight = 48, pickerHeight = 216;
    
    CGFloat baseWidth = ZHCScreenHeight - ZHCBottomSafeHeight - (buttonHeight + pickerHeight);
    self.baseView.frame = CGRectMake(0, baseWidth, ZHCScreenWidth, buttonHeight + pickerHeight);
    self.cancelButton.frame = CGRectMake(0, 0, ZHCScreenWidth / 2, buttonHeight);
    self.confirmButton.frame = CGRectMake(ZHCScreenWidth / 2, 0, ZHCScreenWidth / 2, buttonHeight);
    self.pickerView.frame = CGRectMake(0, buttonHeight, ZHCScreenWidth, pickerHeight);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (int i = 0; i < _defaultSelectedRows.count; i++) {
        if (i > self.pickerView.numberOfComponents - 1) {
            return;
        }
        NSInteger row = ((NSNumber *)_defaultSelectedRows[i]).integerValue;
        [self.pickerView selectRow:row inComponent:i animated:NO];
    }
}

#pragma mark - Public

- (void)setBaseDataArray:(NSArray<NSArray *> *)array {
    _dataArray = array;
}

- (void)addSelfToKeyWindow {
    [self addSelfToView:UIApplication.sharedApplication.keyWindow];
}

- (void)addSelfToView:(UIView *)view {
    [view addSubview:self];
    self.alpha = 0;
    
    CGFloat orginalTop = self.baseView.zhc_top;
    self.baseView.zhc_top = ZHCScreenHeight;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
        self.baseView.zhc_top = orginalTop;
    }];
}

- (void)removeSelf {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        self.baseView.zhc_top = ZHCScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)confirmEvent {}

- (void)cancelEvent {}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return _dataArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _dataArray[component].count;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return _defaultRowHeight;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _dataArray[component][row];
}

#pragma mark - Click Event

- (void)confirmButtonClicked {
    [self confirmEvent];
    [self removeSelf];
}

- (void)cancelButtonClicked {
    [self cancelEvent];
    [self removeSelf];
}

#pragma mark - tool

- (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setAdjustsImageWhenHighlighted:NO];
    [button setAdjustsImageWhenDisabled:NO];
    
    return button;
}

#pragma mark - Getter

- (UIView *)baseView {
    if (!_baseView) {
        _baseView = [UIView new];
    }
    return _baseView;
}

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [UIPickerView new];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        _pickerView.backgroundColor = UIColor.whiteColor;
    }
    return _pickerView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [self buttonWithTitle:@"确定" titleColor:UIColor.whiteColor fontSize:16 backgroundColor:UIColor.cyanColor target:self action:@selector(confirmButtonClicked)];
    }
    return _confirmButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [self buttonWithTitle:@"取消" titleColor:UIColor.whiteColor fontSize:16 backgroundColor:UIColor.grayColor target:self action:@selector(cancelButtonClicked)];
    }
    return _cancelButton;
}

@end
