//
//  ViewController.m
//  Animation Demo
//
//  Created by Andrii Tishchenko on 13.05.15.
//  Copyright (c) 2015 Andrii Tishchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *images;

@property CGFloat speed;

@end

#define imageNames @[@"ani-stop.png", @"ani0.png", @"ani1.png", @"ani2.png", @"ani3.png"]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.speed = 0.5;
    
    self.images = [[NSMutableArray alloc] init];

    for (int i = 1; i < imageNames.count; i++) {
        [_images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }

    [self animation:NO];
}

-(void)animation:(BOOL)status
{
    
    self.imageView.animationDuration = self.speed;
    if (status) {
        self.imageView.animationImages = _images;
        [self.imageView startAnimating];
    }
    else
    {
        self.imageView.image = [UIImage imageNamed:[imageNames objectAtIndex:0]];
        [self.imageView stopAnimating];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonStart_click:(id)sender {
    [self animation:YES];
}
- (IBAction)buttonStop_click:(id)sender {
        [self animation:NO];
}
- (IBAction)sliderSpeed_changed:(id)sender {
    UISlider*slider = (UISlider*)sender;
    self.speed =slider.value;
    self.imageView.animationDuration = self.speed;
    [self.imageView startAnimating];
}

@end
