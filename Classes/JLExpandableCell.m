#import "JLExpandableCell.h"
#import "JLExpandableCellRow.h"


@interface JLExpandableCell ()
@property(nonatomic, strong) UIView *parent;
@property(nonatomic, strong) UIView *innerView;
@end

@implementation JLExpandableCell

- (id)initWithYPosition:(CGFloat)yPoint {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(10, yPoint, 300, 10);
        // Default View Stylings
        self.innerColor = [UIColor colorWithRed:231/255.0f green:235/255.0f blue:238/255.0f alpha:1.0f];
        self.wrapperColor = [UIColor colorWithRed:167/255.0f green:194/255.0f blue:210/255.0f alpha:1.0f];
        self.corner_radius = 10;
        self.backgroundColor = self.wrapperColor;
        self.layer.cornerRadius = self.corner_radius;
        
        
        [self createInnerView];
    }
    
    return self;
}

- (void)createInnerView {
    self.innerView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height-10)];
    self.innerView.backgroundColor = self.innerColor;
    self.innerView.layer.cornerRadius = self.corner_radius;
    [self addSubview:self.innerView];
}

- (JLExpandableCellRow *)newRow{
    return [[JLExpandableCellRow alloc] initWithFrame:CGRectMake(5, self.frame.size.height, self.frame.size.width - 20, 0)];
}

#pragma mark helpers

- (void)addDividerAtYPoint:(CGFloat)yPoint {
    UIView *divider = [[UIView alloc]init];
    divider.frame = CGRectMake(0, yPoint, self.innerView.frame.size.width, 2);
    divider.backgroundColor = self.wrapperColor;
    [self.innerView addSubview:divider];
}

- (void)insertView:(UIView *)childView{
    [self.innerView addSubview:childView];
    
    CGRect newOuterFrame = self.frame;
    newOuterFrame.size.height += childView.bounds.size.height + 10;
    self.frame = newOuterFrame;
    
    CGRect newInnerFrame = self.innerView.frame;
    newInnerFrame.size.height += childView.bounds.size.height + 10;
    self.innerView.frame = newInnerFrame;
    
}

- (void)newDivision {
    [self addDividerAtYPoint:self.frame.size.height - 10];
}
@end