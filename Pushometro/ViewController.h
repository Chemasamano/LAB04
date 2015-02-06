//
//  ViewController.h
//  Pushometro
//
//  Created by Chemamac on 2/6/15.
//  Copyright (c) 2015 Chemamac. All rights reserved.
//

#import <UIKit/UIKit.h>

NSTimer *tiempo;
int s;
int contador;
NSString *pts;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *segundos;
@property (strong, nonatomic) IBOutlet UIButton *iniciar;

@property (strong, nonatomic) IBOutlet UILabel *clicks;
@property (strong, nonatomic) IBOutlet UIButton *pulsar;
@property (strong, nonatomic) IBOutlet UILabel *total;
@property (strong, nonatomic) IBOutlet UILabel *aqui;
@property (strong, nonatomic) IBOutlet UIButton *resultados;

//@property (strong) NSString *pts;

@property (strong) NSManagedObjectContext *record;


- (IBAction)comenzar:(id)sender;
- (IBAction)pulsado:(id)sender;
- (IBAction)resultados:(id)sender;
- (void)contar;

@end

