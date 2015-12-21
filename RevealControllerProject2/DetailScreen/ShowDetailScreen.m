//
//  ShowDetailScreen.m
//  FunnyFood
//
//  Created by hoangdangtrung on 10/23/15.
//  Copyright © 2015 hoangdangtrung. All rights reserved.
//

#import "ShowDetailScreen.h"

@interface ShowDetailScreen ()
@property (weak, nonatomic) IBOutlet UIImageView *imageFood;
@property (weak, nonatomic) IBOutlet UILabel *labelFoodName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelSaleOff;

@end

@implementation ShowDetailScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.stringNameFood;
    self.imageFood.image = self.imgFood;
    self.labelFoodName.text = self.stringNameFood;
    self.labelPrice.text = self.stringPrice;
    self.labelSaleOff.text = self.stringSaleOff;
}



@end
