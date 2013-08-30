//
//  NEODetailControllerCar.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 18-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEODetailControllerCar : UIViewController{
    
    NSString *brand;
    NSString *model;
    NSString *price;
    NSString *imageCar;
    NSString *aviso;
    
    IBOutlet UILabel *brandLabel;
    IBOutlet UILabel *modelLabel;
    IBOutlet UILabel *priceLabel;
    IBOutlet UIImageView *imageCarView;
    IBOutlet UILabel *avisoLabel;
}
@property (nonatomic, retain)NSString *brand, *model, *price, *imageCar, *aviso;
@property (nonatomic, retain)IBOutlet UILabel *brandLabel, *modelLabel, *priceLabel, *avisoLabel;
@property (nonatomic, retain)IBOutlet UIImageView *imageCarView;
@end
