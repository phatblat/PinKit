/*
 * build.gradle.kts
 * PinKit
 */

/* -------------------------------------------------------------------------- */
// 🛃 Imports
/* -------------------------------------------------------------------------- */

import org.gradle.api.DefaultTask

/* -------------------------------------------------------------------------- */
// 🔌 Plugins
/* -------------------------------------------------------------------------- */

plugins {
    base
    // id("at.phatbl.clamp") version "1.0.0"
    id("at.phatbl.swiftpm") version "1.1.0"
}

/* -------------------------------------------------------------------------- */
// ☑️ Tasks
/* -------------------------------------------------------------------------- */

open class PinKitTask : DefaultTask() {
    init {
        group = "📌 PinKit"
    }
}

tasks {
    named("clean").configure {
        dependsOn("swiftpmClean")
        dependsOn("swiftpmReset")
    }

    named("assemble").configure {
        dependsOn("swiftBuild")
    }

    register<PinKitTask>("test") {
        dependsOn("swiftTest")
    }

    register<PinKitTask>("codeQuality") {
        doLast { logger.lifecycle("$name task not implemented") }
    }

    named("build").configure {
        dependsOn("assemble")
        dependsOn("test")
        dependsOn("codeQuality")
    }

    register<PinKitTask>("release") {
        doLast { logger.lifecycle("$name task not implemented") }
    }

    register<PinKitTask>("deploy") {
        doLast { logger.lifecycle("$name task not implemented") }
    }
}
