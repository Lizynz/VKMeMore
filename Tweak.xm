#import <substrate.h>

static const NSBundle *tweakBundle = [NSBundle bundleWithPath:@"/Library/Application Support/VKMe/Localizations.bundle"];
#define LOCALIZED(str) [tweakBundle localizedStringForKey:str value:@"" table:nil]

@interface VKAudioBackgroundStreamingManager : NSObject
@end

// Disable 30 min audio
%hook VKAudioBackgroundStreamingManage
- (BOOL)canListenBackground {
    return YES;
}
%end

// Hide Large title
%hook DialogsController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook DialogsContainerController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ContactListController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ContactsSelectionListController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ModerSettingsController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

// Add quick action
%hook AppDelegate

- (id)init {
    %orig;

    UIApplicationShortcutIcon *postIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"write_outline_28"];
    UIApplicationShortcutIcon *photoIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"picture_outline_28"];
    
    UIMutableApplicationShortcutItem *vkPost = [[%c(UIMutableApplicationShortcutItem) alloc] initWithType:@"post" localizedTitle:LOCALIZED(@"post") localizedSubtitle:nil icon:postIcon userInfo:nil];
    UIMutableApplicationShortcutItem *vkPhoto = [[%c(UIMutableApplicationShortcutItem) alloc] initWithType:@"photo" localizedTitle:LOCALIZED(@"photo") localizedSubtitle:nil icon:photoIcon userInfo:nil];

    [[UIApplication sharedApplication] setShortcutItems: @[ vkPost, vkPhoto ]];
    
    return %orig;
}

%end
