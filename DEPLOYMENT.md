# Deployment Guide

## Backend (Flask)
1. **Heroku**:
   - Install Heroku CLI: [heroku.com](https://devcenter.heroku.com/articles/heroku-cli)
   - Run: `heroku create medical-app-backend`
   - Set env: `heroku config:set FLASK_SECRET_KEY=your_key`
   - Deploy: `git push heroku main`
2. **Docker**:
   - Build: `docker build -t medical-app .`
   - Run: `docker run -p 5000:5000 medical-app`

## Frontend (Flutter)
1. **Mobile**:
   - Android: `flutter build apk --release`
   - iOS: `flutter build ipa` (requires Apple Developer account)
2. **Web**:
   - Build: `flutter build web --release`
   - Deploy: Upload `build/web/` to Netlify or GitHub Pages.