{ inputs, pkgs, ... }:
{
	imports = [
		inputs.caelestia-shell.homeManagerModules.default
	];

	programs.caelestia = {
		enable = true;

		cli = {
			enable = true;
	
			settings.theme.enableTerm = false;
			settings.theme.enableBtop = false;
			settings.theme.enableGtk = false;
		};
	
		settings = {
			appearance = {
				anim = {
					durations = {
						scale = 1;
					};
				};

				font = {
					size = {
						scale = 1;
					};
				};

				padding.scale = 1;
				rounding.scale = 1;
				spacing.scale = 1;

				transparency = {
					enabled = true;
					base = 0.9;
					layers = 0.9;
				};
			};

			general = {
				apps = {
					terminal = [ "alacritty" ];
					audio = [ "pavucontrol" ];
					explorer = [ "thunar" ];
				};

				idle = {
					lockBeforeSleep = true;

					timeouts = [
						{
							timeout = 1000;
							idleAction = "lock";
						}
					];
				};
			};

            background = {
              	enabled = true;
              	desktopClock.enabled = false;
              	visualiser.enabled = false;
            };
			
			bar = {
              	sizes = {
                	innerWidth = 35;
                	windowPreviewSize = 400;
                	trayMenuWidth = 300;
                	batteryWidth = 250;
                	networkWidth = 320;
              	};

              	clock = {
                	showIcon = false;
              	};

              	entries = [
                	{
                  		id = "clock";
                  		enabled = true;
                	}
                	{
                  		id = "activeWindow";
                  		enabled = false;
                	}
                	{
                  		id = "workspaces";
                  		enabled = true;
                	}
                	{
                  		id = "tray";
                  		enabled = true;
                	}
                	{
                  		id = "statusIcons";
                  		enabled = true;
                	}
                	{
                  		id = "power";
                  		enabled = true;
                	}
              	];

              	workspaces = {
                	shown = 6;
                	activeIndicator = true;
                	activeTrail = true;
                	occupiedBg = true;
              	};

              	status = {
                	showAudio = true;
                	showBattery = true;
                	showMicrophone = false;
                	showKbLayout = false;
                	showNetwork = true;
                	showBluetooth = true;
                	showLockStatus = true;
              	};

              	tray = {
                	background = false;
                	recolour = true;
              	};
            };

			border = {
				rounding = 25;
				thickness = 8;
			};

			dashboard = {
				enabled = true;
				showOnHover = false;
				
				dragThreshold = 50;

				mediaUpdateInterval = 500;
				visualiserBars = 45;

				sizes = {
					tabIndicatorHeight = 3;
					tabIndicatorSpacing = 5;
					infoWidth = 200;
                	infoIconSize = 25;
                	dateTimeWidth = 110;
                	mediaWidth = 200;
                	mediaProgressSweep = 180;
                	mediaProgressThickness = 8;
                	resourceProgessThickness = 10;
                	weatherWidth = 250;
                	mediaCoverArtSize = 0; # 150
                	mediaVisualiserSize = 0; # 80
                	resourceSize = 200;
				};
			};

			launcher = {
				actionPrefix = ">";
				dragThreshold = 50;
				vimKeybinds = true;
				enableDangerousActions = false;
				maxShown = 7;
				maxWallpapers = 9;

				useFuzzy = {
					apps = true;
					actions = true;
					schemes = true;
					variants = true;
					wallpapers = true;
				};
			};

			lock = {
				recolourLogo = false;
			};

			notifs = {
				actionOnClick = false;
				clearThreshold = 0.3;
				defaultExpireTimeout = 1000;
				expandThreshold = 20;
				expire = true;
			};

			osd = {
				hideDelay = 2000;
			};

			paths = {
				mediaGif = "h:/assets/bongocat.gif";
				sessionGif = "../../../assets/pengu.gif";
				wallpaperDir = "~/Pictures/Wallpapers";
			};

			services = {
				gpuType = "NVIDIA";

        	    useFahrenheit = false;
    	        useTwelveHourClock = false;

				smartScheme = true;
			};

			session = {
				dragThreshold = 30;
				vimKeybinds = true;
				commands = {
					logout = [ "hyprctl" "dispatch" "exit" ];
					shutdown = [ "systemctl" "poweroff" ];
					hibernate = [ "systemctl" "hibernate" ];
					reboot = [ "systemctl" "reboot" ];
				};
			};
		};
	};
}
