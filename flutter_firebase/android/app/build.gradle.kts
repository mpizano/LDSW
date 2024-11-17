// build.gradle.kts (nivel de módulo/app)
plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Aplica el complemento aquí
    kotlin("android")
}

android {
    compileSdk = 33

    defaultConfig {
        applicationId = "com.example.tuapp"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

dependencies {
    // Importa la BoM (Bill of Materials) de Firebase para asegurar versiones compatibles
    implementation(platform("com.google.firebase:firebase-bom:33.6.0"))

    // Agrega las bibliotecas de Firebase que necesitas (sin especificar versiones)
    implementation("com.google.firebase:firebase-analytics-ktx")
    implementation("com.google.firebase:firebase-auth-ktx")
    implementation("com.google.firebase:firebase-firestore-ktx")

    // Agrega otras dependencias que ya estés utilizando
    implementation("androidx.core:core-ktx:1.9.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.8.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
}
