//
//  HLSTextFieldTouchDetector.h
//  CoconutKit
//
//  Created by Samuel Défago on 04.12.11.
//  Copyright (c) 2011 Hortis. All rights reserved.
//

/**
 * Private class for implementation purposes. Traps when a text field enters or exits edit mode, enabling tap detection
 * during edit mode. This allows us to dismiss the keyboard if the user taps outside a text field when it is in edit 
 * mode (this feature can be disabled)
 *
 * Designated initializer: -initWithTextField:
 */
@interface HLSTextFieldTouchDetector : NSObject <UIGestureRecognizerDelegate>

/**
 * Create a touch detector for the specified text field (not retained)
 */
- (id)initWithTextField:(UITextField *)textField;

/**
 * If set to YES, the text field is asked to relinquish its first responder status (if it is the first responder)
 * Default value is YES
 */
@property (nonatomic, assign, getter=isResigningFirstResponderOnTap) BOOL resigningFirstResponderOnTap;

@end
