target "dotnet" {
    dockerfile = "dotnet/Dockerfile"
}

target "golang" {
    dockerfile = "golang/Dockerfile"
}

target "java" {
    dockerfile = "java/Dockerfile"
}

target "all" {
    contexts = {
        dotnet = "target:dotnet"
        golang = "target:golang"
        java = "target:java"
    }
    output = ["binaries"]
}