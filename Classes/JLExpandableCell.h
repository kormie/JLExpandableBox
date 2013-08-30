#import <Foundation/Foundation.h>

@class JLExpandableCellRow;

@interface JLExpandableCell : UIView
@property(nonatomic, copy) UIColor *innerColor;
@property(nonatomic, copy) UIColor *wrapperColor;
@property(nonatomic) CGFloat corner_radius;

- (id)initWithYPosition:(CGFloat)yPoint;

- (JLExpandableCellRow *)newRow;

- (void)insertView:(UIView *)childView;

- (void)newDivision;
@end
