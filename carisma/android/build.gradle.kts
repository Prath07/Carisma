buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Use version 4.3.15 to avoid conflicts
        classpath("com.google.gms:google-services:4.3.15")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// NOTE:
// Do NOT include the plugins { id("com.google.gms.google-services") version "4.4.2" apply false } block here.
// The Google Services plugin version is managed by the classpath above.
