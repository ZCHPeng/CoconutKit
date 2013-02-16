//
//  LayerPropertiesTestViewController.m
//  CoconutKit-dev
//
//  Created by Samuel Défago on 8/31/12.
//  Copyright (c) 2012 Hortis. All rights reserved.
//

#import "LayerPropertiesTestViewController.h"

@interface LayerPropertiesTestViewController ()

- (void)reloadData;
- (void)reset;

@end

@implementation LayerPropertiesTestViewController

#pragma mark Object creation and destruction

- (void)releaseViews
{
    [super releaseViews];
    
    self.rectangleView = nil;
    self.topSubview = nil;
    self.bottomSubview = nil;
    self.transformTxSlider = nil;
    self.transformTxLabel = nil;
    self.transformTySlider = nil;
    self.transformTyLabel = nil;
    self.transformTzSlider = nil;
    self.transformTzLabel = nil;
    self.transformRxSlider = nil;
    self.transformRxLabel = nil;
    self.transformRySlider = nil;
    self.transformRyLabel = nil;
    self.transformRzSlider = nil;
    self.transformRzLabel = nil;
    self.transformSxSlider = nil;
    self.transformSxLabel = nil;
    self.transformSySlider = nil;
    self.transformSyLabel = nil;
    self.transformSzSlider = nil;
    self.transformSzLabel = nil;
    self.sublayerTransformTxSlider = nil;
    self.sublayerTransformTxLabel = nil;
    self.sublayerTransformTySlider = nil;
    self.sublayerTransformTyLabel = nil;
    self.sublayerTransformTzSlider = nil;
    self.sublayerTransformTzLabel = nil;
    self.sublayerTransformRxSlider = nil;
    self.sublayerTransformRxLabel = nil;
    self.sublayerTransformRySlider = nil;
    self.sublayerTransformRyLabel = nil;
    self.sublayerTransformRzSlider = nil;
    self.sublayerTransformRzLabel = nil;
    self.sublayerTransformSxSlider = nil;
    self.sublayerTransformSxLabel = nil;
    self.sublayerTransformSySlider = nil;
    self.sublayerTransformSyLabel = nil;
    self.sublayerTransformSzSlider = nil;
    self.sublayerTransformSzLabel = nil;
    self.sublayerTransformSkewSlider = nil;
    self.sublayerTransformSkewLabel = nil;
    self.anchorPointXSlider = nil;
    self.anchorPointXLabel = nil;
    self.anchorPointYSlider = nil;
    self.anchorPointYLabel = nil;
    self.anchorPointZSlider = nil;
    self.anchorPointZLabel = nil;
    self.viewSublayerTransformSkewSlider = nil;
    self.viewSublayerTransformSkewLabel = nil;
}

#pragma mark Accessors and mutators

@synthesize rectangleView = _rectangleView;

@synthesize topSubview = _topSubview;

@synthesize bottomSubview = _bottomSubview;

@synthesize transformTxSlider = _transformTxSlider;

@synthesize transformTxLabel = _transformTxLabel;

@synthesize transformTySlider = _transformTySlider;

@synthesize transformTyLabel = _transformTyLabel;

@synthesize transformTzSlider = _transformTzSlider;

@synthesize transformTzLabel = _transformTzLabel;

@synthesize transformRxSlider = _transformRxSlider;

@synthesize transformRxLabel = _transformRxLabel;

@synthesize transformRySlider = _transformRySlider;

@synthesize transformRyLabel = _transformRyLabel;

@synthesize transformRzSlider = _transformRzSlider;

@synthesize transformRzLabel = _transformRzLabel;

@synthesize transformSxSlider = _transformSxSlider;

@synthesize transformSxLabel = _transformSxLabel;

@synthesize transformSySlider = _transformSySlider;

@synthesize transformSyLabel = _transformSyLabel;

@synthesize transformSzSlider = _transformSzSlider;

@synthesize transformSzLabel = _transformSzLabel;

@synthesize sublayerTransformTxSlider = _sublayerTransformTxSlider;

@synthesize sublayerTransformTxLabel = _sublayerTransformTxLabel;

@synthesize sublayerTransformTySlider = _sublayerTransformTySlider;

@synthesize sublayerTransformTyLabel = _sublayerTransformTyLabel;

@synthesize sublayerTransformTzSlider = _sublayerTransformTzSlider;

@synthesize sublayerTransformTzLabel = _sublayerTransformTzLabel;

@synthesize sublayerTransformRxSlider = _sublayerTransformRxSlider;

@synthesize sublayerTransformRxLabel = _sublayerTransformRxLabel;

@synthesize sublayerTransformRySlider = _sublayerTransformRySlider;

@synthesize sublayerTransformRyLabel = _sublayerTransformRyLabel;

@synthesize sublayerTransformRzSlider = _sublayerTransformRzSlider;

@synthesize sublayerTransformRzLabel = _sublayerTransformRzLabel;

@synthesize sublayerTransformSxSlider = _sublayerTransformSxSlider;

@synthesize sublayerTransformSxLabel = _sublayerTransformSxLabel;

@synthesize sublayerTransformSySlider = _sublayerTransformSySlider;

@synthesize sublayerTransformSyLabel = _sublayerTransformSyLabel;

@synthesize sublayerTransformSzSlider = _sublayerTransformSzSlider;

@synthesize sublayerTransformSzLabel = _sublayerTransformSzLabel;

@synthesize sublayerTransformSkewSlider = _sublayerTransformSkewSlider;

@synthesize sublayerTransformSkewLabel = _sublayerTransformSkewLabel;

@synthesize anchorPointXSlider = _anchorPointXSlider;

@synthesize anchorPointXLabel = _anchorPointXLabel;

@synthesize anchorPointYSlider = _anchorPointYSlider;

@synthesize anchorPointYLabel = _anchorPointYLabel;

@synthesize anchorPointZSlider = _anchorPointZSlider;

@synthesize anchorPointZLabel = _anchorPointZLabel;

@synthesize viewSublayerTransformSkewSlider = _viewSublayerTransformSkewSlider;

@synthesize viewSublayerTransformSkewLabel = _viewSublayerTransformSkewLabel;

#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set zPositions so that layers can be seen not to be on the same plane when playing with sublayer transforms
    self.topSubview.layer.zPosition = 100.f;
    self.bottomSubview.layer.zPosition = -100.f;
    
    [self reset];
}

#pragma mark Orientation management

- (NSUInteger)supportedInterfaceOrientations
{
    return [super supportedInterfaceOrientations] & UIInterfaceOrientationMaskPortrait;
}

#pragma mark Localization

- (void)localize
{
    [super localize];
    
    self.title = NSLocalizedString(@"Layer properties test", @"Layer properties test");
}

#pragma mark Refreshing the screen

- (void)reloadData
{
    // Labels
    self.transformTxLabel.text = [NSString stringWithFormat:@"t_x = %.2f", self.transformTxSlider.value];
    self.transformTyLabel.text = [NSString stringWithFormat:@"t_y = %.2f", self.transformTySlider.value];
    self.transformTzLabel.text = [NSString stringWithFormat:@"t_z = %.2f", self.transformTzSlider.value];
    self.transformRxLabel.text = [NSString stringWithFormat:@"r_x = %.2f", self.transformRxSlider.value];
    self.transformRyLabel.text = [NSString stringWithFormat:@"r_y = %.2f", self.transformRySlider.value];
    self.transformRzLabel.text = [NSString stringWithFormat:@"r_z = %.2f", self.transformRzSlider.value];
    self.transformSxLabel.text = [NSString stringWithFormat:@"s_x = %.2f", self.transformSxSlider.value];
    self.transformSyLabel.text = [NSString stringWithFormat:@"s_y = %.2f", self.transformSySlider.value];
    self.transformSzLabel.text = [NSString stringWithFormat:@"s_z = %.2f", self.transformSzSlider.value];
    
    self.sublayerTransformTxLabel.text = [NSString stringWithFormat:@"t_x = %.2f", self.sublayerTransformTxSlider.value];
    self.sublayerTransformTyLabel.text = [NSString stringWithFormat:@"t_y = %.2f", self.sublayerTransformTySlider.value];
    self.sublayerTransformTzLabel.text = [NSString stringWithFormat:@"t_z = %.2f", self.sublayerTransformTzSlider.value];
    self.sublayerTransformRxLabel.text = [NSString stringWithFormat:@"r_x = %.2f", self.sublayerTransformRxSlider.value];
    self.sublayerTransformRyLabel.text = [NSString stringWithFormat:@"r_y = %.2f", self.sublayerTransformRySlider.value];
    self.sublayerTransformRzLabel.text = [NSString stringWithFormat:@"r_z = %.2f", self.sublayerTransformRzSlider.value];
    self.sublayerTransformSxLabel.text = [NSString stringWithFormat:@"s_x = %.2f", self.sublayerTransformSxSlider.value];
    self.sublayerTransformSyLabel.text = [NSString stringWithFormat:@"s_y = %.2f", self.sublayerTransformSySlider.value];
    self.sublayerTransformSzLabel.text = [NSString stringWithFormat:@"s_z = %.2f", self.sublayerTransformSzSlider.value];
    self.sublayerTransformSkewLabel.text = [NSString stringWithFormat:@"skew = %.4f", self.sublayerTransformSkewSlider.value];
    
    self.anchorPointXLabel.text = [NSString stringWithFormat:@"x = %.2f", self.anchorPointXSlider.value];
    self.anchorPointYLabel.text = [NSString stringWithFormat:@"y = %.2f", self.anchorPointYSlider.value];
    self.anchorPointZLabel.text = [NSString stringWithFormat:@"z = %.2f", self.anchorPointZSlider.value];
    
    self.viewSublayerTransformSkewLabel.text = [NSString stringWithFormat:@"skew = %.4f", self.viewSublayerTransformSkewSlider.value];
    
    // Layer transform
    CATransform3D rotationTransformX = CATransform3DMakeRotation(self.transformRxSlider.value, 1.f, 0.f, 0.f);
    CATransform3D rotationTransformY = CATransform3DMakeRotation(self.transformRySlider.value, 0.f, 1.f, 0.f);
    CATransform3D rotationTransformZ = CATransform3DMakeRotation(self.transformRzSlider.value, 0.f, 0.f, 1.f);
    CATransform3D scaleTransform = CATransform3DMakeScale(self.transformSxSlider.value,
                                                          self.transformSySlider.value,
                                                          self.transformSzSlider.value);
    CATransform3D translationTransform = CATransform3DMakeTranslation(self.transformTxSlider.value,
                                                                      self.transformTySlider.value,
                                                                      self.transformTzSlider.value);
    
    CATransform3D transform = CATransform3DConcat(rotationTransformX, rotationTransformY);
    transform = CATransform3DConcat(transform, rotationTransformZ);
    transform = CATransform3DConcat(transform, scaleTransform);
    transform = CATransform3DConcat(transform, translationTransform);
    self.rectangleView.layer.transform = transform;
    
    // Sublayer transform
    CATransform3D sublayerRotationTransformX = CATransform3DMakeRotation(self.sublayerTransformRxSlider.value, 1.f, 0.f, 0.f);
    CATransform3D sublayerRotationTransformY = CATransform3DMakeRotation(self.sublayerTransformRySlider.value, 0.f, 1.f, 0.f);
    CATransform3D sublayerRotationTransformZ = CATransform3DMakeRotation(self.sublayerTransformRzSlider.value, 0.f, 0.f, 1.f);
    CATransform3D sublayerScaleTransform = CATransform3DMakeScale(self.sublayerTransformSxSlider.value,
                                                                  self.sublayerTransformSySlider.value,
                                                                  self.sublayerTransformSzSlider.value);
    CATransform3D sublayerTranslationTransform = CATransform3DMakeTranslation(self.sublayerTransformTxSlider.value,
                                                                              self.sublayerTransformTySlider.value,
                                                                              self.sublayerTransformTzSlider.value);
    
    CATransform3D sublayerTransform = CATransform3DIdentity;
    sublayerTransform.m34 = self.sublayerTransformSkewSlider.value;
    sublayerTransform = CATransform3DConcat(sublayerTransform, sublayerRotationTransformX);
    sublayerTransform = CATransform3DConcat(sublayerTransform, sublayerRotationTransformY);
    sublayerTransform = CATransform3DConcat(sublayerTransform, sublayerRotationTransformZ);
    sublayerTransform = CATransform3DConcat(sublayerTransform, sublayerScaleTransform);
    sublayerTransform = CATransform3DConcat(sublayerTransform, sublayerTranslationTransform);
    self.rectangleView.layer.sublayerTransform = sublayerTransform;
    
    // Anchor point
    self.rectangleView.layer.anchorPoint = CGPointMake(self.anchorPointXSlider.value, self.anchorPointYSlider.value);
    self.rectangleView.layer.anchorPointZ = self.anchorPointZSlider.value;
    
    // View controller's view sublayer transform
    CATransform3D viewSublayerTransform = self.view.layer.sublayerTransform;
    viewSublayerTransform.m34 = self.viewSublayerTransformSkewSlider.value;
    self.view.layer.sublayerTransform = viewSublayerTransform;
}

- (void)reset
{
    self.transformTxSlider.value = 0.f;
    self.transformTySlider.value = 0.f;
    self.transformTzSlider.value = 0.f;
    self.transformRxSlider.value = 0.f;
    self.transformRySlider.value = 0.f;
    self.transformRzSlider.value = 0.f;
    self.transformSxSlider.value = 1.f;
    self.transformSySlider.value = 1.f;
    self.transformSzSlider.value = 1.f;
    
    self.sublayerTransformTxSlider.value = 0.f;
    self.sublayerTransformTySlider.value = 0.f;
    self.sublayerTransformTzSlider.value = 0.f;
    self.sublayerTransformRxSlider.value = 0.f;
    self.sublayerTransformRySlider.value = 0.f;
    self.sublayerTransformRzSlider.value = 0.f;
    self.sublayerTransformSxSlider.value = 1.f;
    self.sublayerTransformSySlider.value = 1.f;
    self.sublayerTransformSzSlider.value = 1.f;
    self.sublayerTransformSkewSlider.value = 0.f;
    
    self.anchorPointXSlider.value = 0.5f;
    self.anchorPointYSlider.value = 0.5f;
    self.anchorPointZSlider.value = 0.5f;
    
    self.viewSublayerTransformSkewSlider.value = 0.f;
    
    [self reloadData];
}

#pragma mark Action callbacks

- (IBAction)settingsChanged:(id)sender
{
    [self reloadData];
}

- (IBAction)reset:(id)sender
{
    [self reset];
}

@end
