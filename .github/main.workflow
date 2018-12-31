workflow "Docker Images" {
  on = "push"
  resolves = [
    "GitHub Action for Docker-1",
    "Push libretime-analyzer",
  ]
}

action "Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build libretime-web" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-web web/"
}

action "Tag libretime-web" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["GitHub Action for Docker"]
  args = "libretime-web hairmare/libretime-web"
}

action "Push libretime-web" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Tag"]
  args = "push hairmare/libretime-web"
}

action "Build libretime-analyzer" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-analyzer analyzer/"
}

action "Tag libretime-analyzer" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["GitHub Action for Docker-2"]
  args = "libretime-analyzer hairmare/libretime-analyzer"
}

action "Push libretime-analyzer" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-analyzer"]
  args = "push hairmare/libretime-analyzer"
}
