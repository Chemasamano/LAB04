//
//  ViewController.m
//  Pushometro
//
//  Created by Chemamac on 2/6/15.
//  Copyright (c) 2015 Chemamac. All rights reserved.
//

#import "ViewController.h"
@import CoreData;

@interface ViewController ()

@end

@implementation ViewController
@synthesize iniciar;
@synthesize clicks;
@synthesize pulsar;
@synthesize total;
@synthesize aqui;
@synthesize resultados;
@synthesize record;
//@synthesize pts;




- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    contador = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)comenzar:(id)sender {
    s = 0;
    tiempo = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(contar) userInfo:nil repeats:YES];
    iniciar.hidden=true;
    clicks.hidden = false;
    pulsar.hidden = false;
    total.hidden = false;
    aqui.hidden = false;
}

- (IBAction)pulsado:(id)sender {
    contador = contador +1;
    clicks.text = [NSString stringWithFormat:@"%i",contador];
    
    pts = [NSString stringWithFormat:@"%i",contador];
    
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSLog(@"Fecha y hora del juego: %@",[DateFormatter stringFromDate:[NSDate date]]);
    NSString *fecha = [DateFormatter stringFromDate:[NSDate date]];
    
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (record) {
        [record setValue:pts forKey:@"puntos"];
        [record setValue:fecha forKey:@"fecha"];
        /*[contacto setValue:Tedad.text forKey:@"edad"];
         [contacto setValue:Tstatus.text forKey:@"estatus"];
         [contacto setValue:Temail.text forKey:@"correo"];
         [contacto setValue:Tlink.text forKey:@"link"];*/
    } else {
        
        NSManagedObject *new = [NSEntityDescription insertNewObjectForEntityForName:@"Records" inManagedObjectContext:context];
        [new setValue:pts forKey:@"puntos"];
        [new setValue:fecha forKey:@"fecha"];
        /*[newcontacto setValue:Tedad.text forKey:@"edad"];
         [newcontacto setValue:Tstatus.text forKey:@"estatus"];
         [newcontacto setValue:Temail.text forKey:@"correo"];
         [newcontacto setValue:Tlink.text forKey:@"link"];
         */
    }
    
    
    //[record setValue:pts forKey:@"puntos"];
    
    //pts = self.clicks.text;
    //return pts;
}

- (IBAction)resultados:(id)sender {
    
    /*NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSLog(@"Fecha y hora del juego: %@",[DateFormatter stringFromDate:[NSDate date]]);
    NSString *fecha = [DateFormatter stringFromDate:[NSDate date]];
    */
    //NSLog(@"Valor del contador: %@",[NSString stringWithFormat:@"%i",contador]);
    
    //pts = [NSString stringWithFormat:@"%i",contador];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    /*
    if (record) {
        [record setValue:pts forKey:@"puntos"];
        [record setValue:fecha forKey:@"fecha"];
        [contacto setValue:Tedad.text forKey:@"edad"];
        [contacto setValue:Tstatus.text forKey:@"estatus"];
        [contacto setValue:Temail.text forKey:@"correo"];
        [contacto setValue:Tlink.text forKey:@"link"];
    } else {
        
        NSManagedObject *new = [NSEntityDescription insertNewObjectForEntityForName:@"Records" inManagedObjectContext:context];
        [new setValue:pts forKey:@"puntos"];
        [new setValue:fecha forKey:@"fecha"];
        [newcontacto setValue:Tedad.text forKey:@"edad"];
        [newcontacto setValue:Tstatus.text forKey:@"estatus"];
        [newcontacto setValue:Temail.text forKey:@"correo"];
        [newcontacto setValue:Tlink.text forKey:@"link"];
        
    }
    */
    
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Error al guardar %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

- (void)contar{
    s += 1;
    _segundos.text = [NSString stringWithFormat:@"%i",s];
    if (s==10) {
        tiempo.invalidate;
        iniciar.hidden=true;
        //_iniciar.enabled=false;
        pulsar.enabled=false;
        //resultados.hidden = false;
        resultados.hidden=false;
    }
}


@end
