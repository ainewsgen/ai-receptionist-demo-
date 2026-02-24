#!/bin/bash

# Configuration
N8N_WEBHOOK_URL="https://n8n-service-k507.onrender.com/webhook/vapi-google-prod"
VAPI_SECRET="T4e_d3wP0int_Gr0up_S3cret_2026!"

# 1. Test Availability Check
echo "Testing Availability Check..."
curl -X POST "$N8N_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -H "x-vapi-secret: $VAPI_SECRET" \
  -d '{
    "message": {
      "type": "tool_call",
      "toolCalls": [{
        "id": "test_avail_1",
        "function": {
          "name": "check_availability",
          "arguments": {
            "date": "2026-02-24",
            "person": "Patchen"
          }
        }
      }]
    }
  }'

# 2. Test Booking
echo -e "\n\nTesting Appointment Booking..."
curl -X POST "$N8N_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -H "x-vapi-secret: $VAPI_SECRET" \
  -d '{
    "message": {
      "type": "tool_call",
      "toolCalls": [{
        "id": "test_book_1",
        "function": {
          "name": "book_appointment",
          "arguments": {
            "startTime": "2026-02-24T14:00:00Z",
            "endTime": "2026-02-24T14:30:00Z",
            "email": "test@example.com",
            "reason": "Demo session"
          }
        }
      }]
    }
  }'

# 3. Test Question Logging
echo -e "\n\nTesting Question Logging..."
curl -X POST "$N8N_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -H "x-vapi-secret: $VAPI_SECRET" \
  -d '{
    "message": {
      "type": "tool_call",
      "toolCalls": [{
        "id": "test_log_1",
        "function": {
          "name": "log_unanswered_question",
          "arguments": {
            "question": "What is the meaning of life?",
            "context": "Customer asked during demo"
          }
        }
      }]
    }
  }'
