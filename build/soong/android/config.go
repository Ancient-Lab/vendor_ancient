package android

// Global config used by ion soong additions
var IonConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.pixelexperience.keydisabler",
	},
}
