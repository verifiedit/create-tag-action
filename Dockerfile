FROM alpine/git:latest

LABEL "com.github.actions.name"="Create Tag Action"
LABEL "com.github.actions.description"="Create Git tag on repository"
LABEL "com.github.actions.icon"="tag"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/verifiedit/create-tag-action"
LABEL "homepage"="https://github.com/verifiedit/create-tag-action"

RUN apk add coreutils

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
