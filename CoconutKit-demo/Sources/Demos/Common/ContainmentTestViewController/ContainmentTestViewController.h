//
//  ContainmentTestViewController.h
//  CoconutKit-demo
//
//  Created by Samuel Défago on 8/10/12.
//  Copyright (c) 2012 Hortis. All rights reserved.
//

@interface ContainmentTestViewController : HLSViewController {
@private
    UISwitch *_presentingModalSwitch;
}

@property (nonatomic, retain) IBOutlet UISwitch *presentingModalSwitch;

- (IBAction)hideWithModal:(id)sender;

@end
