FROM python:3.12-alpine
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 FLAG=flag{demo_change_before_competition}
WORKDIR /challenge
COPY challenge.py /challenge/challenge.py
RUN printf '%s\n' "$FLAG" > /flag \
    && adduser -D -u 10001 player \
    && chown root:root /flag && chmod 0444 /flag \
    && chown -R root:root /challenge \
    && chmod 0555 /challenge /challenge/challenge.py
USER 10001:10001
ENTRYPOINT ["python", "/challenge/challenge.py"]
