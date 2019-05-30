plugins {
    java
    application
    id("com.github.johnrengelman.shadow") version "5.0.0"
}

repositories {
    jcenter()
}

dependencies {
//    implementation("com.google.guava:guava:27.0.1-jre")
    testImplementation("junit:junit:4.12")
}

application {
    mainClassName = "org.abelsromero.benchmark.App"
}
