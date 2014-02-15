#example 1:

New-TransportRule –Name Signature –ApplyHtmlDisclaimerLocation Append `
–ApplyHtmlDisclaimerText "Best Regards<br><br>%%displayName%% | `
%% title %%<br>%%company%% | %%department%%<br>%%streetAddress%%<br>" `
–FromScope InOrganization

