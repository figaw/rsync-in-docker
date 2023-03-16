# rsync in docker

| envvar      | description                   | default |
| ----------- | ----------------------------- | ------- |
| R_DEST      | sync to                       | -       |
| R_SRC       | sync from                     | -       |
| R_INTERVAL  | sync interval seconds         | 60s     |
| R_STAYALIVE | stay alive if misconfigured\* | -       |

\* helpful in a container orchestrator like k8s,
where restarting won't magically fix a misconfiguration

## Probes

`/tmp/healthy` file, if startup worked
`/tmp/ready` file, if configured properly

## Example

create two folders `folder-dest`, `folder-src`,
execute `run.sh`.
