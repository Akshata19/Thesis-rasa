# Use the "full" Rasa image which already bundles rasa-sdk
FROM rasa/rasa:3.5.11-full

# Switch to root to install any extra OS deps (if needed)
USER root
WORKDIR /app

# Copy your entire project in
COPY . /app

# (Optional) If you want to retrain on build, otherwise
# you can pre-build your model locally
RUN rasa train

# Switch back to non‑root user
USER 1001

# Expose the Rasa HTTP API port
EXPOSE 5005
# Expose the actions server port (if you want to talk to it separately)
EXPOSE 5055

# Start both the HTTP API and the action server
# `&` backgrounds the first process, then the second runs in foreground
CMD rasa run --enable-api --cors "*" --debug & \
    rasa run actions --actions actions


