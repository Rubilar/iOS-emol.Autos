//
//  NEODetailControllerTestDrive.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 30-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEODetailControllerTestDrive : UIViewController
{
NSString *title;
NSString *descentTitle;
NSString *imageTestDrive;
IBOutlet UILabel *titleLabel;
IBOutlet UILabel *descentTitleLabel;
IBOutlet UIImageView *imageTestDriveView;
}
@property (nonatomic, retain)NSString *title, *descentTitle, *imageTestDrive;
@property (nonatomic, retain)IBOutlet UILabel *titleLabel, *descentTitleLabel;
@property (nonatomic, retain)IBOutlet UIImageView *imageTestDriveView;

@end
