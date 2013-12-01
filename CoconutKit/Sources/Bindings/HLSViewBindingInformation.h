//
//  HLSViewBindingInformation.h
//  CoconutKit
//
//  Created by Samuel Défago on 18.06.13.
//  Copyright (c) 2013 Hortis. All rights reserved.
//

/**
 * Private class encapsulating view binding information, and performing lazy binding parameter validation and caching
 */
@interface HLSViewBindingInformation : NSObject

/**
 * Store view binding information. A keypath and a view are mandatory, otherwise the method returns nil. The object
 * parameter can be one of the following:
 *   - a non-nil object, which the keypath is applied to (binding to an object)
 *   - nil, in which case the keypath is applied to the responder chain starting with view
 */
- (id)initWithObject:(id)object keyPath:(NSString *)keyPath formatterName:(NSString *)formatterName view:(UIView *)view;

/**
 * Return the current text corresponding to the stored binding information. If keypath information is invalid,
 * this method returns nil
 */
- (NSString *)text;

/**
 * Return YES iff the information has been verified once
 */
@property (nonatomic, readonly, assign, getter=isVerified) BOOL verified;

@end
