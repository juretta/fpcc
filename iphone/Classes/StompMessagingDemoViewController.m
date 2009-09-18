//
//  StompMessagingDemoViewController.m
//  StompMessagingDemo
//
//  Created by Stefan Saasen on 10.09.09.
//  Copyright coravy 2009. All rights reserved.
//

#import "StompService.h"
#import "StompMessagingDemoViewController.h"

@interface StompMessagingDemoViewController(PrivateMethods)
-(void) connectToMQ:(NSString *) host;
@end


@implementation StompMessagingDemoViewController

@synthesize service;
@synthesize messages;
@synthesize inputField;
@synthesize addressField;
@synthesize statusImage;
@synthesize refreshConnectionBtn;

@synthesize sendBtn;
@synthesize sendDefaultBtn;

@synthesize versionLabel;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[self inputField] setDelegate:self];
	[[self addressField] setDelegate:self];
	
	NSString *address = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsHostKey];
	if(address) {
		[[self addressField] setText:address];
	} else {
		[[self addressField] setText:kMQHost];
	}
	[self connectToMQ: kMQHost];
	
	[[self versionLabel] setText:CRV_VERSION];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark Action methods
-(IBAction) sendMessage {
	[[self service] sendBody:[[self inputField] text] toDestination:kMQTopicName];
	[[self inputField] resignFirstResponder];
}

// for the lazy demo without typing
-(IBAction) sendDefaultMessage {
	[[self service] sendBody:kDefaultMessageText toDestination:kMQTopicName];		
}

-(IBAction) refreshConnection {
	[self connectToMQ: [[self addressField] text]];
}

#pragma mark -
#pragma mark StompServiceDelegate
- (void)stompServiceDidConnect:(StompService *)stompService {
	NSLog(@"stompServiceDidConnect");
	[[self statusImage] setImage:[UIImage imageNamed:@"network-idle.png"]];
	
	[[self refreshConnectionBtn] setHidden:YES];
	[[self addressField] setHidden:YES];
	
	[[self sendBtn] setHidden:NO];
	[[self sendDefaultBtn] setHidden:NO];
	
	[[NSUserDefaults standardUserDefaults] setObject:[[self addressField] text] forKey:kUserDefaultsHostKey];
}

- (void)stompService:(StompService *)stompService gotMessage:(NSString *)body withHeader:(NSDictionary *)messageHeader {
	NSLog(@"gotMessage body: %@, header: %@", body, messageHeader);
	
	[[self messages] setText:body];
	
	NSLog(@"Message ID: %@", [messageHeader valueForKey:@"message-id"]);
	// If we have successfully received the message ackknowledge it.
	[stompService ack: [messageHeader valueForKey:@"message-id"]];
	//[stompService ack:body];
}

- (void)stompServiceDidDisconnect:(StompService *)stompService {
	NSLog(@"stompServiceDidDisconnect");
	
	[[self sendBtn] setHidden:YES];
	[[self sendDefaultBtn] setHidden:YES];
	
	[[self refreshConnectionBtn] setHidden:NO];
	[[self addressField] setHidden:NO];
	[[self statusImage] setImage:[UIImage imageNamed:@"network-error.png"]];
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *) theTextField {
	if(theTextField == [self inputField]) {
		[self sendMessage];
	} else if(theTextField == [self addressField]) {
		[self refreshConnection];
	}
	return YES;
}


#pragma mark -
#pragma mark PrivateMethods
-(void) connectToMQ:(NSString *) host {
	StompService *s = [[StompService alloc] initWithHost:host 
													port:kMQPort 
												   login:kMQUsername 
												passcode:kMQPassword 
												delegate:self];
	[s connect];
	[self setService:s];
	[s release];
	
	NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys: @"client", @"ack", @"true", @"activemq.dispatchAsync", @"1", @"activemq.prefetchSize", nil];
	[service subscribeToDestination:kMQTopicName withHeader: headers];	
}

- (void)dealloc {
	[service unsubscribeToDestination:kMQTopicName];
	[service release];
	[refreshConnectionBtn release];
	
	[sendBtn release];
	[sendDefaultBtn release];
	
	[versionLabel release];
	
	[inputField release];
	[addressField release];
	[messages release];
	[statusImage release];
    [super dealloc];
}

@end
