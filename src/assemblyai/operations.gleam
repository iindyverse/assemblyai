import assemblyai/schema
import gleam/bool
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option
import gleam/result
import oas/generator/utils

pub fn get_transcript_sentences_request(base, transcript_id) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id <> "/sentences"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_transcript_sentences_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.sentences_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn upload_file_request(base) {
  let method = http.Post
  let path = "/v2/upload"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn upload_file_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.uploaded_file_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_subtitles_request(
  base,
  transcript_id,
  subtitle_format,
  chars_per_caption chars_per_caption,
) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id <> "/" <> subtitle_format
  let query = [
    #("chars_per_caption", option.map(chars_per_caption, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_subtitles_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn lemur_question_answer_request(base, data) {
  let method = http.Post
  let path = "/lemur/v3/generate/question-answer"
  let query = []
  let body =
    utils.json_to_bits(schema.lemur_question_answer_params_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn lemur_question_answer_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.lemur_question_answer_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn lemur_summary_request(base, data) {
  let method = http.Post
  let path = "/lemur/v3/generate/summary"
  let query = []
  let body = utils.json_to_bits(schema.lemur_summary_params_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn lemur_summary_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.lemur_summary_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_transcript_paragraphs_request(base, transcript_id) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id <> "/paragraphs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_transcript_paragraphs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.paragraphs_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn word_search_request(base, transcript_id, words words) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id <> "/word-search"
  let query = [
    #(
      "words",
      option.Some(fn(_) { panic as "query parameter is not supported" }(words)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn word_search_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.word_search_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn purge_lemur_request_data_request(base, request_id) {
  let method = http.Delete
  let path = "/lemur/v3/" <> request_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn purge_lemur_request_data_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.purge_lemur_request_data_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_lemur_response_request(base, request_id) {
  let method = http.Get
  let path = "/lemur/v3/" <> request_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_lemur_response_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.lemur_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_transcript_request(base, transcript_id) {
  let method = http.Delete
  let path = "/v2/transcript/" <> transcript_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_transcript_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.transcript_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_transcript_request(base, transcript_id) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_transcript_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.transcript_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_redacted_audio_request(base, transcript_id) {
  let method = http.Get
  let path = "/v2/transcript/" <> transcript_id <> "/redacted-audio"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_redacted_audio_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.redacted_audio_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_temporary_token_request(base, data) {
  let method = http.Post
  let path = "/v2/realtime/token"
  let query = []
  let body =
    utils.json_to_bits(schema.create_realtime_temporary_token_params_encode(
      data,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_temporary_token_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.realtime_temporary_token_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_transcript_request(base, data) {
  let method = http.Post
  let path = "/v2/transcript"
  let query = []
  let body = utils.json_to_bits(schema.transcript_params_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_transcript_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.transcript_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_transcripts_request(
  base,
  limit limit,
  status status,
  created_on created_on,
  before_id before_id,
  after_id after_id,
  throttled_only throttled_only,
) {
  let method = http.Get
  let path = "/v2/transcript"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("status", status),
    #("created_on", created_on),
    #("before_id", before_id),
    #("after_id", after_id),
    #("throttled_only", option.map(throttled_only, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_transcripts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.transcript_list_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn lemur_task_request(base, data) {
  let method = http.Post
  let path = "/lemur/v3/generate/task"
  let query = []
  let body = utils.json_to_bits(schema.lemur_task_params_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn lemur_task_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.lemur_task_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}
