workflow "Docker Images" {
  on = "push"
  resolves = ["GitHub Action for Docker-1"]
}

action "Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-web web/"
}

action "Docker Tag" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["GitHub Action for Docker"]
  args = "libretime-web hairmare/libretime-web"
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Tag"]
  args = "push hairmare/libretime-web"
}
