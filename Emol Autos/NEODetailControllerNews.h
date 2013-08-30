//
//  NEODetailControllerNews.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 25-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEODetailControllerNews : UIViewController
{
NSString *title;
NSString *descentTitle;
NSString *imageNews;
IBOutlet UILabel *titleLabel;
IBOutlet UILabel *descentTitleLabel;
IBOutlet UIImageView *imageNewsView;
}
@property (nonatomic, retain)NSString *title, *descentTitle, *imageNews;
@property (nonatomic, retain)IBOutlet UILabel *titleLabel, *descentTitleLabel;
@property (nonatomic, retain)IBOutlet UIImageView *imageNewsView;

@end
