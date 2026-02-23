# AI Receptionist Demo

This project contains the n8n workflows for a demo AI Receptionist integrated with Vapi, Google Calendar, Gmail, and Google Sheets.

## Project Overview

The AI Receptionist ("Alex") handles inbound phone calls, manages appointments, logs customer queries, and sends follow-up messages.

### Workflows Included

1. **AI Receptionist Inbound Handler** (`AI_Receptionist_Final.json`):
    - Connects to Vapi via Webhook.
    - Routes tool calls for `check_availability`, `book_appointment`, `take_message`, and `log_unanswered_question`.
    - Integrates with Google Calendar for availability and booking.
    - Logs unanswered questions and call summaries to Google Sheets.
2. **Answer Dispatcher** (`Answer_Dispatcher_Final.json`):
    - Periodically checks Google Sheets for answered questions.
    - Sends follow-ups via SMS (Twilio), Email (Gmail), or outbound calls (Vapi) based on customer preference.

## Configuration

- **Vapi Assistant ID**: `d1a8d5e8-decb-454c-842d-3b80a4cbd7c8` (Prototype)
- **Phone Number**: `+18443210745` (Twilio)
- **Google Sheets Database**: `1Vda6Snc-wtiQY9aJDthqcC_D33onW1s8t4NFOacUBYE`
- **Webhook Path**: `/webhook/vapi-google-prod`

## Setup Instructions

1. **n8n**: Import the JSON files into your n8n instances.
2. **Vapi**: Configure the `prototype` assistant's **Server URL** to point to your n8n production webhook.
3. **Environment Variables**: Ensure n8n has the necessary credentials for Google (OAuth2) and Twilio.

## Testing

A mock test script is provided in `tests/mock_calls.sh` to verify webhook routing without making actual phone calls.
