//
//  LifeCycleTestViewController.h
//  nut-demo
//
//  Created by Samuel Défago on 2/15/11.
//  Copyright 2011 Hortis. All rights reserved.
//

/**
 * A view controller logging view lifecycle events
 */
@interface LifeCycleTestViewController : HLSViewController {
@private
    UILabel *m_instructionLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *instructionLabel;

@end
