/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComActs18techUservoiceModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "TiApp.h"
#import "UVConfig.h"
#import "UserVoice.h"


@implementation ComActs18techUservoiceModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"848eb3ed-bf4d-4827-bba2-6bf79d92c29d";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.acts18tech.uservoice";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	

	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)showContactUsForm:(id)value
{
	ENSURE_UI_THREAD_1_ARG(value);
	UIViewController *vc = [UserVoice getUserVoiceContactUsFormForModalDisplay];
	[[TiApp app] showModalController: vc animated:YES];
}


-(void)initUserVoice:(id)value
{
	NSString *site = [TiUtils stringValue:value];

}

-(id)getUserVoiceSite
{
	return _userVoiceSite;
}

-(void)setUserVoiceSite:(id)value
{
	_userVoiceSite = [TiUtils stringValue:value];
	UVConfig *config = [UVConfig configWithSite: _userVoiceSite];
	[UserVoice initialize:config];
}


@end
