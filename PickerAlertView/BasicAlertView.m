//
//  BasicAlertView.m
//  PickerAlertView
//
//  Created by manuel garcia lopez on 26/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicAlertView.h"

#define ANCHO_ENTRE_VIEW 5.0
#define VALOR_BOTTON_VIEW 15.0
#define ANCHO_TOTAL 320.0
#define ANCHO_PICKER 300.0
#define ALTO_PICKER 216.0
#define IZQUIERDA_PICKER 10.0

@implementation BasicAlertView

- (id)initWithFrame:(CGRect)frame 
{
	if (self = [super initWithFrame:frame])
    {
	  myBasicView= [self createContentView];
	}
	return self;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return TRUE;
}


- (void)setFrame:(CGRect)rect 
{
	[super setFrame:CGRectMake(0, 0, ANCHO_TOTAL, [self OrdenarCampos])]; 
    
    if (UIDeviceOrientationIsValidInterfaceOrientation([[UIDevice currentDevice] orientation])) 
    {
        CGRect screenRect = [self obtenerAnchoRealPantalla];
        self.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);
        
    }
}

-(CGRect) obtenerAnchoRealPantalla
{
    CGRect lResultado=[[UIScreen mainScreen] bounds];
    
    //si esta en landscape intercambiamos width por height;
    if (UIDeviceOrientationIsLandscape( [[UIDevice currentDevice] orientation]))
        lResultado = CGRectMake(lResultado.origin.x, lResultado.origin.y, lResultado.size.height, lResultado.size.width);
    
    return lResultado;
}

- (float)OrdenarCampos 
{
    float lflvalorY =0;
    float lflAltoBoton =0;
    
    if ([self.subviews count]>0) 
    {   
        lflvalorY+= ANCHO_ENTRE_VIEW;
        
        for (UIView *view in self.subviews)
        {
            if ([view isKindOfClass:[UILabel class]] && view.hidden ==FALSE )
            {
                UILabel *lobjLabel = (UILabel*) view;
                if ([lobjLabel.text isEqualToString:@""]==FALSE) 
                {
                    view.frame = CGRectMake(view.frame.origin.x, lflvalorY, view.frame.size.width, view.frame.size.height);
                    lflvalorY = view.frame.origin.y + view.frame.size.height;
                }
            }
        }  
        
        lflvalorY+= ANCHO_ENTRE_VIEW;
        
        myBasicView.frame = CGRectMake(IZQUIERDA_PICKER, lflvalorY, ANCHO_PICKER, ALTO_PICKER);
        lflvalorY = lflvalorY + ALTO_PICKER + ANCHO_ENTRE_VIEW;
        
        for (UIView *view in self.subviews)
        {
            if ([view isKindOfClass:[UIButton class]] && view.hidden ==FALSE)
            {
                view.frame = CGRectMake(view.frame.origin.x, lflvalorY, view.frame.size.width, view.frame.size.height);
                lflAltoBoton = view.frame.size.height;
            }
        }
        return   lflvalorY +  lflAltoBoton + VALOR_BOTTON_VIEW;
    }
    else 
    {  // todavia no se ha creado las subvistas
        return 0;
    }
}


#pragma mark - BasicView 

- (id)createContentView
{
    myBasicView = [[UIView alloc] initWithFrame:CGRectZero]; 
    
	[self addSubview:myBasicView];
    
    return myBasicView;
}
@end
