workflow "Docker Images" {
  on = "push"
  resolves = [
    "Push libretime-web",
    "Push libretime-analyzer",
    "Push libretime-celery",
    "Push libretime-icecast",
    "Push libretime-liquidsoap",
    "Push libretime-playout",
    "Push libretime-init",
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
  needs = ["Build libretime-web"]
  args = "libretime-web hairmare/libretime-web"
}

action "Push libretime-web" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-web"]
  args = "push hairmare/libretime-web"
}

action "Build libretime-analyzer" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-analyzer analyzer/"
}

action "Tag libretime-analyzer" {
  uses = "actions/docker/tag@76ff57a"
  needs = [
    "Build libretime-analyzer",
  ]
  args = "libretime-analyzer hairmare/libretime-analyzer"
}

action "Push libretime-analyzer" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-analyzer"]
  args = "push hairmare/libretime-analyzer"
}

action "Build libretime-celery" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-celery celery/"
}

action "Tag libretime-celery" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["Build libretime-celery"]
  args = "libretime-celery hairmare/libretime-celery"
}

action "Push libretime-celery" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-celery"]
  args = "push libretime-celery"
}

action "Build libretime-icecast" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-icecast icecast/"
}

action "Tag libretime-icecast" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["Build libretime-icecast"]
  args = "libretime-icecast hairmare/libretime-icecast"
}

action "Push libretime-icecast" {
  uses = "actions/docker/cli@76ff57a"
  args = "push hairmare/libretime-icecast"
  needs = ["Tag libretime-icecast"]
}

action "Build libretime-liquidsoap" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-liquidsoap"
}

action "Tag libretime-liquidsoap" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["Build libretime-liquidsoap"]
  args = "libretime-liquidsoap hairmare/libretime-liquidsoap"
}

action "Push libretime-liquidsoap" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-liquidsoap"]
  args = "push hairmare/libretime-liquidsoap"
}

action "Build libretime-playout" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-playout"
}

action "Tag libretime-playout" {
  uses = "actions/docker/tag@76ff57a"
  args = "libretime-playout hairmare/libretime-playout"
  needs = ["Build libretime-playout"]
}

action "Push libretime-playout" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-playout"]
  args = "push -t hairmare/libretime-playout"
}

action "Build libretime-init" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "build -t libretime-init init/"
}

action "Tag libretime-init" {
  uses = "actions/docker/tag@76ff57a"
  args = "libretime-init hairmare/libretime-init"
  needs = ["Build libretime-init"]
}

action "Push libretime-init" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Tag libretime-init"]
  args = "push hairmare/libretime-init"
}
