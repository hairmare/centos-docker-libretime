workflow "New workflow" {
  on = "push"
  resolves = ["Docker Tag"]
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
  args = "librretime-web hairmare/libretime-web"
}
