# Docker Nginx RubyApp from Github

Docker image based on passenger:baseimage that pulls a github repo (limited to optional subfolder) and starts a ruby passenger app such as rails or sinatra

Environment variables:

- GITHUB_REPO (required)
- GITHUB_SSH_KEY (required)
- GIT_PATH (optional, defaults to "/")
- GIT_BRANCH (optional, defaults to "master")


You can then run via

```bash
docker run -p 80:80  --name github-rubyapp -e GITHUB_REPO="git@github.com:myorg/myrepo.git" -e GITHUB_SSH_KEY="`cat path_to_my_github_key`" boritzio/docker-github-rubyapp
```