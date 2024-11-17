// build.gradle.kts (nivel de proyecto)
plugins {
    // Otros complementos que ya tengas
    id("com.android.application") version "8.1.0" apply false
    id("com.android.library") version "8.1.0" apply false

    // Agrega el complemento de servicios de Google
    id("com.google.gms.google-services") version "4.4.2" apply false
}

// Repositories to fetch the plugin
repositories {
    google() // Required for Android plugins
    mavenCentral()
}
