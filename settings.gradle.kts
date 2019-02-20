/*
 * settings.gradle.kts
 * PinKit
 */

rootProject.name = "PinKit"

val clamp = file("../../gradle/Clamp")
if (clamp.exists()) {
    includeBuild(clamp) {
        dependencySubstitution {
            substitute(module("at.phatbl:clamp")).with(project(":"))
        }
    }
}

val swiftPM = file("../../gradle/SwiftPM-Plugin")
if (swiftPM.exists()) {
    includeBuild(swiftPM) {
        dependencySubstitution {
            substitute(module("at.phatbl:swiftpm")).with(project(":"))
        }
    }
}

pluginManagement {
    repositories {
        gradlePluginPortal()
    }
    resolutionStrategy {
        eachPlugin {
            when (requested.id.id) {
                "at.phatbl.clamp" ->
                    useModule("at.phatbl:clamp:${requested.version}")
                "at.phatbl.swiftpm" ->
                    useModule("at.phatbl:swiftpm:${requested.version}")
                else -> Unit
            }
        }
    }
}
