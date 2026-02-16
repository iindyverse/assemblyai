import assemblyai/operations
import gleam/http/request
import gleam/string
import midas/task as t
import snag

pub fn base_request(token) {
  request.new()
  |> request.set_host("api.assemblyai.com")
  |> request.prepend_header("Authorization", token)
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  case response {
    Ok(response) -> Ok(response)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

// GENERATED -------------

pub fn get_transcript_sentences(token, transcript_id) {
  let request = base_request(token)
  let request = operations.get_transcript_sentences_request(
    request,
    transcript_id,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_transcript_sentences_response(response)),
  )
  t.done(data)
}

pub fn upload_file(token) {
  let request = base_request(token)
  let request = operations.upload_file_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.upload_file_response(response)))
  t.done(data)
}

pub fn get_subtitles(
  token,
  transcript_id,
  subtitle_format,
  chars_per_caption chars_per_caption,
) {
  let request = base_request(token)
  let request = operations.get_subtitles_request(
    request,
    transcript_id,
    subtitle_format,
    chars_per_caption,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_subtitles_response(response)))
  t.done(data)
}

pub fn lemur_question_answer(token, data) {
  let request = base_request(token)
  let request = operations.lemur_question_answer_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.lemur_question_answer_response(response)),
  )
  t.done(data)
}

pub fn lemur_summary(token, data) {
  let request = base_request(token)
  let request = operations.lemur_summary_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.lemur_summary_response(response)))
  t.done(data)
}

pub fn get_transcript_paragraphs(token, transcript_id) {
  let request = base_request(token)
  let request = operations.get_transcript_paragraphs_request(
    request,
    transcript_id,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_transcript_paragraphs_response(response)),
  )
  t.done(data)
}

pub fn word_search(token, transcript_id, words words) {
  let request = base_request(token)
  let request = operations.word_search_request(request, transcript_id, words)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.word_search_response(response)))
  t.done(data)
}

pub fn purge_lemur_request_data(token, request_id) {
  let request = base_request(token)
  let request = operations.purge_lemur_request_data_request(request, request_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.purge_lemur_request_data_response(response)),
  )
  t.done(data)
}

pub fn get_lemur_response(token, request_id) {
  let request = base_request(token)
  let request = operations.get_lemur_response_request(request, request_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_lemur_response_response(response)),
  )
  t.done(data)
}

pub fn delete_transcript(token, transcript_id) {
  let request = base_request(token)
  let request = operations.delete_transcript_request(request, transcript_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_transcript_response(response)),
  )
  t.done(data)
}

pub fn get_transcript(token, transcript_id) {
  let request = base_request(token)
  let request = operations.get_transcript_request(request, transcript_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_transcript_response(response)))
  t.done(data)
}

pub fn get_redacted_audio(token, transcript_id) {
  let request = base_request(token)
  let request = operations.get_redacted_audio_request(request, transcript_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_redacted_audio_response(response)),
  )
  t.done(data)
}

pub fn create_temporary_token(token, data) {
  let request = base_request(token)
  let request = operations.create_temporary_token_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_temporary_token_response(response)),
  )
  t.done(data)
}

pub fn create_transcript(token, data) {
  let request = base_request(token)
  let request = operations.create_transcript_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_transcript_response(response)),
  )
  t.done(data)
}

pub fn list_transcripts(
  token,
  limit limit,
  status status,
  created_on created_on,
  before_id before_id,
  after_id after_id,
  throttled_only throttled_only,
) {
  let request = base_request(token)
  let request = operations.list_transcripts_request(
    request,
    limit,
    status,
    created_on,
    before_id,
    after_id,
    throttled_only,
  )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_transcripts_response(response)),
  )
  t.done(data)
}

pub fn lemur_task(token, data) {
  let request = base_request(token)
  let request = operations.lemur_task_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.lemur_task_response(response)))
  t.done(data)
}
